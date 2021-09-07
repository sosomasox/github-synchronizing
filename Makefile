IMG=sosomasox/github-synchronizing:v1alpha1

docker-buildx:
	docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
	docker buildx build --platform linux/amd64,linux/arm64 -t ${IMG} --no-cache --push .
