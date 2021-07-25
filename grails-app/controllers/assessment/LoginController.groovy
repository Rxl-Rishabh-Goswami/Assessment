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
            render(view: 'dashboard', model: [user:user])
        }
        else{
            redirect(action:'index')

        }
    }
    def register(){
        if(params['password'] == params['confirm']) {
            User user = new User(email: params['email'], username: params['username'], firstName: params['firstName'], lastName: params['lastName'], password: params['password'], active: true, admin: false, photo: [1, 2, 3, 4])
            user.save(flush:true,failOnError:true)
            redirect(action: 'index')


        }
        else{

            redirect(action:'index')
        }
    }
    def forgetPassword(){
        render(view: 'forgetpassword')
        User user = User.findWhere(username: params['username'],email: params['email'])
        if(user){
            render(view: 'changepassword')
        }
        else{
            render("User Not Found")
        }

    }
    def changePassword(){
        if(params['newpassword']==params['confirmpassword']){
            render{"heyy"}
        }
        else{
            render("Bye")
        }

    }
    def logout(){
        session.invalidate()
        render(view: 'index')
    }

}




