module github.com/sretooling/drone-plugin-cloud-registry

require (
	github.com/99designs/httpsignatures-go v0.0.0-20170731043157-88528bf4ca7e // indirect
	github.com/aws/aws-sdk-go v0.0.0-00010101000000-000000000000 // indirect
	github.com/awslabs/amazon-ecr-credential-helper v0.2.0
	github.com/drone/drone-go v0.8.5-0.20181126001606-1b7bf6421356
	github.com/golang/mock v1.3.1 // indirect
	github.com/google/go-cmp v0.3.1 // indirect
	github.com/kelseyhightower/envconfig v1.3.0
	github.com/mitchellh/go-homedir v1.1.0 // indirect
	github.com/pkg/errors v0.8.0
	github.com/sirupsen/logrus v1.2.0
	github.com/stretchr/testify v1.2.2
)

replace github.com/aws/aws-sdk-go => github.com/aws/aws-sdk-go v1.15.82
