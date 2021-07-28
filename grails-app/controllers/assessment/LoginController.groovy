package assessment

class LoginController {

    def index() { }
    def loginuser() {
        User user = User.findWhere(username: params['username'], password: params['password'])
        if(!user){
            user = User.findWhere(email: params['username'], password: params['password'])
        }
        if (user) {
            session.username = user.username
            redirect(action: 'dashboard') //, model: [user:user])
        }
        else{
            redirect(action:'index')

        }
    }
    def register(){
        if(params['password'] == params['confirm']) {



            User user = new User(email: params['email'], username: params['username'], firstName: params['firstName'], lastName: params['lastName'], password: params['password'], active: true, admin: false)
            def profilePhoto = request.getFile("profilePhoto")
            String origin = profilePhoto.getOriginalFilename()
            if (origin) {
                File file = new File("/home/rxlogix/IdeaProjects/Assessment/grails-app/assets/images/profilePicture/${params.username}.jpg")
                profilePhoto.transferTo(file)
                user.photo ="/profilePicture/${params.username}.jpg"
            }
            if(params.profilePhoto==null){
                user.photo="https://bootdey.com/img/Content/avatar/avatar6.png"
            }
            user.save(flush:true,failOnError:true)
            redirect(action: 'index')


        }
        else{

            redirect(action:'index')
        }
    }
    def forgetPassword(){
        render(view: 'forgetpassword')

    }
    def changePassword(){
        User user = User.findWhere(username: params['username'],email: params['email'])
        if(!user){
            flash.messsage = "User Not Found"
            redirect(action: 'forgetPassword')
        }
        render(view: 'changepassword',model: [userEmail:user.email])


    }
    def updatePassword(){
        if(params.newpassword==params.confirmpassword){
            User user = User.findByEmail(params.email)
            user.password = params.newpassword
            user.save(flush:true)
            render(view: 'index')
        }
        else{
            render(view: 'changepassword')
        }


    }
    def logout(){
        session.invalidate()
        redirect(action: 'index')
    }
    def dashboard(){
        User user = User.findWhere(username: session.username)
        render(view: 'dashboard', model:[user:user])
    }

}




