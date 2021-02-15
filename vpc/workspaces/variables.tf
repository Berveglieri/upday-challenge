variable "configuration" {
  type        = map(map(string))
  description = "Map structure to retrieve the configuration values for the module from the *.tfvars file"
}