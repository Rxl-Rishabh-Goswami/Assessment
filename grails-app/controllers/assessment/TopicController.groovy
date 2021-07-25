package assessment

class TopicController {

    def index() {
        User user = User.findWhere(username: session.username)
        render(view: 'topic',model: [user:user])
    }
}
