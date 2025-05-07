package test

import (
	"testing"
	"os"
	"path/filepath"
	
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// TestTerraformAWSECRModuleBasic tests the basic functionality of the terraform-aws-ecr module
func TestTerraformAWSECRModuleBasic(t *testing.T) {
	t.Parallel()

	// Get the working directory
	workingDir, err := os.Getwd()
	if err != nil {
		t.Fatal(err)
	}

	// Change to parent directory to access module files
	moduleDir := filepath.Join(workingDir, "..")

	// Generate a random name for the ECR repository
	// ecr_repo_name := fmt.Sprintf("test-repo-%s", random.UniqueId())

	// Setup the terraform options with default retryable errors
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: moduleDir,
		
		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"ecr_repo":   "test-repo",
			"mantainer":  "Test Team",
			"project":    "Test Project",
			"environment": "test",
		},
		
		// We don't actually want to create resources, just verify the plan looks correct
		NoColor: true,
		Lock:    true,
		PlanOnly: true,
	})

	// Validate the module can be initialized
	terraform.Init(t, terraformOptions)
	
	// Validate the module can generate a valid plan
	terraform.Plan(t, terraformOptions)
	
	// For this basic test, we just verify the module files exist
	assert.FileExists(t, filepath.Join(moduleDir, "main.tf"))
	assert.FileExists(t, filepath.Join(moduleDir, "variables.tf"))
	assert.FileExists(t, filepath.Join(moduleDir, "outputs.tf"))
	assert.FileExists(t, filepath.Join(moduleDir, "policy.json.tpl"))
	assert.FileExists(t, filepath.Join(moduleDir, "policy-lifecycle.json.tpl"))
}