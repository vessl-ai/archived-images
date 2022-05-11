import fs from 'fs';
import yaml from 'js-yaml';

function getBuildAndTagJobContent(path, dockerfilePath, repository, dependencies, imageName) {
    const harbor = 'harbor.vessl.ai/public';
    const quay = 'quay.io/vessl-ai';
    const tagHarbor = `${harbor}/${repository}:${imageName}`;
    const tagHarborWithVersion = imageName === 'latest' ? `${harbor}/${repository}:$CIRCLE_TAG` : `${tagHarbor}-$CIRCLE_TAG`;
    const tagQuay = `${quay}/${repository}:${imageName}`;
    const tagQuayWithVersion = imageName === 'latest' ? `${quay}/${repository}:$CIRCLE_TAG` : `${tagQuay}-$CIRCLE_TAG`;
    return {
        executor: 'builder',
        steps: [
            'checkout',
            {
                run: {
                    name: `Build ${repository}:${imageName}`,
                    command: `docker build -f ${dockerfilePath} -t ${tagHarbor} -t ${tagHarborWithVersion} -t ${tagQuay} -t ${tagQuayWithVersion} ${path}`
                }
            }
        ]
    }
}

function getPushJobContent(registry, repository, imageName) {
    const registryBaseURL = {
        harbor: 'harbor.vessl.ai/public',
        quay: 'quay.io/vessl-ai'
    }
    const tag = `${registryBaseURL[registry]}/${repository}:${imageName}`;
    const versionedTag = imageName === 'latest' ? `${registryBaseURL[registry]}/${repository}:$CIRCLE_TAG` : `${tag}-$CIRCLE_TAG`;
    const user = `$${registry.toUpperCase()}_USER`;
    const password = `$${registry.toUpperCase()}_PASSWORD`
    const command = `
echo ${password} | docker login -u ${user} --password-stdin
docker push ${versionedTag}
docker push ${tag}`
    return {
        executor: 'builder',
        steps: [
            {
                run: {
                    name: `Push ${repository}:${imageName}`,
                    command
                }
            }
        ]
    }
}

function handlePackageWithSingleDockerfile(path, pkg, repository, dependencies) {
    // @TODO
    const jobs = {};
    jobs[`build-and-tag_${pkg}`] = getBuildAndTagJobContent(
        path,
        `${path}/Dockerfile`,
        repository,
        dependencies,
        'latest'
    )
    jobs[`push-to-harbor_${pkg}`] = getPushJobContent('harbor', repository, 'latest');
    jobs[`push-to-quay_${pkg}`] = getPushJobContent('quay', repository, 'latest');
    return {
        jobs,
        workflowJobs: []
    }
}

function handlePackageWithMultipleDockerfiles(path, pkg, repository, dependencies) {
    const dirs = fs.readdirSync(path);
    const jobs = {}, workflowJobs = [];
    dirs.forEach(f => {
        if (!f.startsWith('Dockerfile.')) {
            return;
        }
        const imageName = f.replace('Dockerfile.', '');
        const canonicalName = imageName.replace(/\./g, '-');
        jobs[`build-and-tag_${pkg}_${canonicalName}`] = getBuildAndTagJobContent(
            path,
            `${path}/${f}`,
            repository,
            dependencies,
            imageName
        );
        jobs[`push-to-harbor_${pkg}_${canonicalName}`] = getPushJobContent('harbor', repository, imageName);
        jobs[`push-to-quay_${pkg}_${canonicalName}`] = getPushJobContent('quay', repository, imageName);
    })
    return { jobs, workflowJobs };
}

function handleDirectory(rootDir, dirPath) {
    const path = `${rootDir}/${dirPath}`;
    try {
        fs.statSync(`${path}/package.yaml`);
    } catch (_) {
        console.log(`${path}/package.yaml not found`);
        process.exit(1);
    }
    const pkg = fs.readFileSync(`${path}/package.yaml`, 'utf8');
    const { repository, dependencies } = yaml.load(pkg);
    try {
        fs.statSync(`${path}/Dockerfile`);
        return handlePackageWithSingleDockerfile(path, dirPath, repository, dependencies);
    } catch (_) {
        return handlePackageWithMultipleDockerfiles(path, dirPath, repository, dependencies);
    }
}
function main() {
    const template = fs.readFileSync('./.circleci/config.template.yml', 'utf8');
    const config = yaml.load(template);
    const rootDir = './images';
    const dirs = fs.readdirSync(rootDir);
    dirs.forEach(d => {
        const { jobs, workflowJobs } = handleDirectory(rootDir, d);
        config.jobs = { ...config.jobs, ...jobs };
        config.workflows['build-docker-images'].jobs.push(...workflowJobs);
    });
    fs.writeFileSync('./.circleci/config.yml', yaml.dump(config));
}
main();