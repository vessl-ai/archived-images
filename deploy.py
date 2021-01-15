import argparse
import subprocess
from pathlib import Path

# REGISTRY_ADDRESS = 'gcr.io/savvy-kit-260206'
# DOCKER_NAME = 'aron-backend-kernel'
REGISTRY_ADDRESS = 'savvihub'
DOCKER_NAME = 'kernels'


def run(cmd):
    return subprocess.run(cmd, shell=True, check=True)


def docker_deploy(docker_dir, tag, push):
    if not Path(docker_dir).is_dir():
        print(f'Docker directory does not found')
        exit()

    dockerfile_path = Path(docker_dir) / f'Dockerfile.{tag}'
    if not Path(dockerfile_path).is_file():
        print(f'Dockerfile does not found')
        exit()

    print(f'Building {dockerfile_path}')

    tag_ref = "{}/{}:{}".format(REGISTRY_ADDRESS, DOCKER_NAME, tag)
    run(f'docker build -t {tag_ref} -f {dockerfile_path} {docker_dir}')
    if push:
        run(f'docker push {tag_ref}')


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--dir', type=str, default='base', help='local directory')
    parser.add_argument('--tag', type=str, default='latest', help='tagging docker image')
    parser.add_argument('--push', default=False, action='store_true', help='Push to GCR T/F')
    return parser.parse_args()


if __name__ == '__main__':
    args = parse_args()
    docker_deploy(args.dir, args.tag, args.push)
