package routers

import (
	"github.com/GAJ-S/tinynavigation/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
}
