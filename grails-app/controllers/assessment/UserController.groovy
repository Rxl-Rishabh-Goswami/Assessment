package assessment

class UserController {

    def index() {
        User user = User.findWhere(username: session.username)
        render(view: 'userprofile',model: [user:user])
    }
}
