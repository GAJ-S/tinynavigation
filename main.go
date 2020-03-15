package main

import (
	_ "github.com/GAJ-S/tinynavigation/routers"

	"github.com/astaxie/beego"
)

func main() {
	beego.LoadAppConfig("ini", "conf/app.conf")

	if beego.BConfig.RunMode == "dev" {
		beego.SetStaticPath("/swagger", "swagger")
		beego.BConfig.WebConfig.DirectoryIndex = true
	}

	beego.Run()
}
