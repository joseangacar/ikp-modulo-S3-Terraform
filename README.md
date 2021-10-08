# ikp-modulo-S3-Terraform

Modulo de S3 que despliegue tantos cubos como se desee. Se permite desplegar también los objetos que se deseen

##Variables
```
bucket = {
  <<NOMBRE_BUCKET1>> : {
    versioning(OPTIONAL) = bool
    bucket_objects = [
      {
        acl(optional) = string
        object = string (key en S3)
        source(OPTIONAL) = string (ruta local)
      },
      {...},
      {...},
      ...
    ]
  },
  <<NOMBRE_BUCKET2>> : {
    ...
  },
  <<NOMBRE_BUCKET3>> : {
    ...
  },
  ...
}
```
