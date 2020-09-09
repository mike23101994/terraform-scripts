package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestInstanceIp(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "F:/POC-Project/terraform",
	}
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
	instanceIP := terraform.Output(t, terraformOptions, "instance_public_ip")
	instanceID := terraform.Output(t, terraformOptions, "instance_id")
	instanceIPFromInstance := aws.GetPublicIpOfEc2Instance(t, instanceID, "us-east-1")
	assert.Equal(t, instanceIP, instanceIPFromInstance)
}

func TestInstanceSshKey(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "F:/POC-Project/terraform",
	}
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
	instanceSshKey := terraform.Output(t, terraformOptions, "instance_key")
	assert.Equal(t, "deployer", instanceSshKey)
}
