# Git Server protected branches

## Setup

You must have the following software installed

- A *NIX shell
- Docker

Port 9418 must be free; this is user-bindable
You should have been able to run `docker run hello-world` and have it succeed

## Running

Just run the below commands in order from within this repo, using a terminal.

```
docker build -t git-server .
docker run -d --name git-server -p 9418:9418 git-server
git clone git://localhost/test-repo.git

cd test-repo
touch file
git add file
git commit -m "Added file"
git push
git checkout -b new-branch
git push --set-upstream origin new-branch
cd ..

rm -rf test-repo
docker rm -f git-server
```
