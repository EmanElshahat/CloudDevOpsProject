def call(imageName) {
    sh """
    docker build -t ${imageName} -f Docker/Dockerfile .
    """
}

