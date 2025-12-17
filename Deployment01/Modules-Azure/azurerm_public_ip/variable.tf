variable "pip01"{
type=map(object({
name =string
rg_name=string
location=string
#pip_key=string
}))
}
