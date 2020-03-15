package routers

import (
	"github.com/GAJ-S/tinynavigation/controllers"
	"github.com/astaxie/beego"
)

func init() {
	ns := beego.NewNamespace("/v1",
		beego.NSNamespace("/bm",
			beego.NSInclude(
				&controllers.BookMarkController{},
			),
		),
	)
	beego.AddNamespace(ns)
}
