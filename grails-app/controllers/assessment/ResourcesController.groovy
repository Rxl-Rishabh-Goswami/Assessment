package assessment

class ResourcesController {

    def index() {
        User user = User.findWhere(username: session.username)
        render(view: 'post',model: [user:user])
    }
}
