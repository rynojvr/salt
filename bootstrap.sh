sudo apt-get update;
sudo apt-get install -y git;

mkdir -p dev/github/rynojvr;
cd dev/github/rynojvr;

git clone https://github.com/rynojvr/salt;
cd salt;

chmod +x setup.sh
./setup.sh -h
