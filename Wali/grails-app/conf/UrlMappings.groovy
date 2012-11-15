class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"/1"(view:"/index1")
		"500"(view:'/error')
	}
}
