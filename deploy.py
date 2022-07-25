import argparse
import subprocess
from pathlib import Path


def run(cmd):
    return subprocess.run(cmd, shell=True, check=True)


def docker_deploy(dockerhub_repo, tag, push, dockerfile_dir):
    if not Path(dockerfile_dir).is_dir():
        print(f'Docker directory does not found')
        exit()

    dockerfile_path = Path(dockerfile_dir) / f'Dockerfile.{tag}'
    if not Path(dockerfile_path).is_file():
        print(f'Dockerfile does not found')
        exit()

    print(f'Building {dockerfile_path}')

    tag_ref = "{}:{}".format(dockerhub_repo, tag)
    run(f'docker build --platform=linux/amd64 -t {tag_ref} -f {dockerfile_path} {dockerfile_dir}')
    if push:
        run(f'docker push {tag_ref}')


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--dockerhub', type=str, default='quay.io/vessl-ai/kernels', help='Docker Hub repository')
    parser.add_argument('-t', '--tag', type=str, default='latest', help='tagging docker image')
    parser.add_argument('DIR', metavar='DIR', type=str, help='Dockerfile directory')
    parser.add_argument('-p', '--push', default=False, action='store_true', help='Push image to Docker Hub T/F')
    return parser.parse_args()


if __name__ == '__main__':
    args = parse_args()
    docker_deploy(args.dockerhub, args.tag, args.push, args.DIR)
