module github.com/sretooling/drone-ecr-registry-plugin

require (
	github.com/awslabs/amazon-ecr-credential-helper v0.2.0
	github.com/sretooling/drone-ecr-registry-plugin
	github.com/drone/drone-go v0.8.5-0.20181126001606-1b7bf6421356
	github.com/kelseyhightower/envconfig v1.3.0
	github.com/pkg/errors v0.8.0
	github.com/sirupsen/logrus v1.2.0
	github.com/stretchr/testify v1.2.2
)

replace github.com/aws/aws-sdk-go => github.com/aws/aws-sdk-go v1.15.82
