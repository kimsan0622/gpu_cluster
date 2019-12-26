#export CUDA_VERSION=10.2
#sudo bash install_cuda_cudnn_nccl.sh $CUDA_VERSION

export CUDA_VERSION=$1
export CUDNN_VERSION=7.6.5.32


echo $CUDA_VERSION
pushd ../

pushd cuda
echo -e \\"e[0;40;32mInstall \\e[1;40;33mcuda ${CUDA_VERSION}\\e[0;40;32m...\\e[0m"
bash install_cuda10.sh
popd

pushd cudnn
echo -e \\"e[0;40;32mInstall \\e[1;40;33mcudnn-v7.6.5\\e[0;40;32m...\\e[0m"
bash cudnn-v7.6.5.sh 1
popd

pushd nccl
echo -e \\"e[0;40;32mInstall \\e[1;40;33mnccl-v2.5.6\\e[0;40;32m...\\e[0m"
bash nccl-v2.5.6.sh 1
popd
popd

