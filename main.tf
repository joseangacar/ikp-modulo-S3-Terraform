//  USO DE FUNCION OPTIONAL:
// https://www.terraform.io/docs/language/expressions/type-constraints.html#experimental-optional-object-type-attributes
terraform {
    experiments = [module_variable_optional_attrs]
}


//  PAGINA DE MODULOS DE AWS EN TERRAFORM:
//  https://registry.terraform.io/namespaces/terraform-aws-modules


module "aws-oficial-s3-module" {

    //  PAGINA DEL MODULO S3:
    //  https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest
    source = "terraform-aws-modules/s3-bucket/aws"
    
    bucket = var.bucket
    acl = var.acl
    versioning = {
        enabled = var.versioning
    }
    tags = var.tags
}
 
resource "aws_s3_bucket_object" "bucket_object" {
    count = length(var.bucket_objects)
 
    bucket = module.aws-oficial-s3-module.s3_bucket_id
    key = var.bucket_objects[count.index].object
    source = var.bucket_objects[count.index].source
}