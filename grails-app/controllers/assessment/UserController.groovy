package assessment

class UserController {

    def index() {
        User user = User.findWhere(username: session.username)
        render(view: 'userprofile',model: [user:user])
    }
    def changeProfile(){
        User user = User.findWhere(username:session.username)
        render(view: 'editprofile',model: [user:user])
    }
    def editProfile(){
        if(params.password==params.confirm){
            User user = User.findWhere(username:session.username)
            user.username = params.username
            user.firstName = params.firstName
            user.lastName = params.lastName
            user.password = params.password
            def profilePhoto = request.getFile("profilePhoto")
            String origin = profilePhoto.getOriginalFilename()
            if (origin) {
                File file = new File("/home/rxlogix/IdeaProjects/Assessment/grails-app/assets/images/profilePicture/${params.username}.jpg")
                profilePhoto.transferTo(file)
                user.photo ="/profilePicture/${params.username}.jpg"
            }
            if(params.profilePhoto==null){
                user.photo="/profilePicture/unknown.jpg"
            }
            user.save(flush:true, failOnError:true)
            flash.userUpdated = "User Details Successfully Updated"
            redirect(action: 'changeProfile')
        }
        else{
            flash.userNotUpdated = "Errr...!!! Try Again"
            redirect(action: 'changeProfile')
        }

    }
    def updatePassword(){
        if(params.newpassword==params.confirmpassword){
            User user = User.findWhere(username:session.username)
            user.password = params.newpassword
            user.save(flush:true,failOnError:true)
            flash.passwordUpdated = "Password Successfully Updated"
            redirect(action: 'changeProfile')
        }
        else{
            flash.passwordNotUpdated = "Errr...!!! Try Again"
            redirect(action:'changeProfile')
        }

    }
    def adminUser(){
        User user = User.findWhere(username: session.username)
        def allUser = User.findAll()
        render(view: 'adminuser',model: [allUser:allUser,user: user])

    }
    def deactivate(){
        def userID = params.userID as Long
        User testUser = User.get(userID)
        testUser.active = false
        testUser.save(flush:true,failOnError:true)
        redirect(controller:'user', action: 'adminUser')

    }
    def activate(){
        def userID = params.userID as Long
        User testUser = User.get(userID)
        testUser.active = true
        testUser.save(flush:true,failOnError:true)
        redirect(controller:'user', action: 'adminUser')

    }
}
