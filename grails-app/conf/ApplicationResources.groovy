modules = {
    application {
        resource url:'js/application.js'
    }

    base {
        dependsOn("bootstrap,bootstrap-responsive-css,modernizr")
        resource url: 'css/app.css'
    }
}