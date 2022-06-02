# GCP App Engine

Project created for demonstrating GCP APP engine application creation.


## Prerequisites

* Gcloud CLI - [Download steps](https://cloud.google.com/sdk/docs/install#windows).   
* Terraform CLI - [Download steps](https://www.terraform.io/downloads).  
* A GCP Project - Ensure that you have a GCP project available.  
* A Google Cloud Storage Bucket - Required if you want to manage the terraform state with gcs backend.  
* The APP Engine API enabled in the GCP project - [Enable APIs](https://cloud.google.com/endpoints/docs/openapi/enable-api#enabling_an_api").  
* [A service account](https://cloud.google.com/iam/docs/creating-managing-service-accounts#creating) with the below roles assigned  
  * App Engine Creator  
  * App Engine Deployer  
  * Cloud Build Service Account  
  * Compute Network User  
  * Service Account User  
  * Service Usage Admin  
  * Storage Object Admin  
* A json key file for the service account - [Key creation](https://cloud.google.com/iam/docs/creating-managing-service-account-keys).  
  
  

## APP Engine creation  
  

### From local machine   

1. Update the local.tf file with project id and location specific to your project.  
  **Note:** App Engine region cannot be changed after creation, please ensure the you are choosing the right region.   

2. Update the backend.tf file with the GCS bucket name specific to your project.  

3. Create an environment variable in your local machine as descibed below.  
  **Name** - GOOGLE_APPLICATION_CREDENTIALS  
  **Value** - {Path to the service account json file}  
  This variable is needed for authenticating to the GCP project. Terraform looks for this value while initializing the backend and making api calls to gcp.  
  We are using a service account here just to make sure that both the pipeline and local deployment processes look similar. You can even use your own credentials for authentication, see [here](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#authentication).  

4. Execute the below commands from the directory in which you have checked out the repo.  
            `cd ./tf`  
            `terraform init`  
            `terraform validate`  
            `terraform plan`  
            `terraform apply`  

5. The app engine application should get created and the output the of the terraform apply command should have the id, name and default host of the app engine application.  
  
  
  
### From GitLab-CI  
  
  
1. Follow steps 1 and 2 from the previous section  

3. Checkin the code with the pipeline yaml file to your repo in gitlab. The initial pipeline run may fail as the variable is not set yet.  

4. Configure a [pipeline variable](https://docs.gitlab.com/ee/ci/variables/#add-a-cicd-variable-to-a-project) as described below  
    **Key** - GOOGLE_APPLICATION_CREDENTIALS  
    **Value** - Contents of the service account json file  
    **Type** - File  
  
5. Run the pipeline.  

6. The app engine application should get created and the output the of the terraform apply command should have the id, name and default host of the app engine application.  



## References  

* [Terraform GCP Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
* [App Engine Terraform Module](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_application)
* [Google App Engine Documentation](https://cloud.google.com/appengine/docs)



