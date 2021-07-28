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
        User user = User.findWhere(username:session.username)
        user.username = params.username
        user.firstName = params.firstName
        user.lastName = params.lastName
        user.password = params.password
        user.save(flush:true, failOnError:true)
        render(view: "editprofile",model: [user:user])
    }
    def updatePassword(){
        User user = User.findWhere(username:session.username)
        user.password = params.newpassword
        user.save(flush:true,failOnError:true)
        render(view: 'editprofile',model: [user:user])
    }
}
