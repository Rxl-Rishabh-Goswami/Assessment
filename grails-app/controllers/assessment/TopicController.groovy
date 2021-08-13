package assessment

class TopicController {
    TopicService topicService
    SubscribeService subscribeService

    def index() {
        User user = User.findWhere(username: session.username)
        if(user){
            def topicID = params.topicID as Long
            Topic topic = Topic.findWhere(id: topicID)
            render(view: 'topic', model: [user: user, topic: topic])
        }else{
            redirect(url: 'http://localhost:9091/')
        }


    }
    def indexWithoutUser(){
        def topicID = params.topicID as Long
        Topic topic = Topic.findWhere(id: topicID)
        render(view: 'topicWithoutUser', model: [topic: topic])
    }

    def createTopic() {
        User user = User.findWhere(username: session.username)
        Topic test = Topic.findByNameAndUser(params.topicName,user)
        if(test){
                flash.createTopic = "This topic Already Exist For ${user.firstName} ${user.lastName}"
                redirect(controller: 'login',action: 'dashboard')

            } else {
                Topic topic = topicService.createTopic(params.topicName, params.topicVisibility, user)
                subscribeService.addSubscriptions(user, topic)
                flash.createTopic = "Topic ${topic.name} Successfully Created !!!"
                redirect(controller: 'login', action: 'dashboard')
        }

    }

    def allTopic() {
        def allTopic = Topic.list()
        User user = User.findWhere(username: session.username)
        render(view: 'adminTopic', model: [allTopic: allTopic, user: user])
    }

    def delete2() {
        def topicID = params.topicID as Long
        Topic topic = Topic.get(topicID)
        topic.delete(flush: true, failOnError: true)
        redirect(controller: 'login', action: 'dashboard')
    }

    def changeVisibility() {
        println params
        def topicID = params.topicID as Long
        Topic topic = Topic.get(topicID)
        topicService.changeVisibility(topic, params.Pri)
        redirect(controller: 'login', action: 'dashboard')

    }
    def changePrivacy() {
        println params
        def topicID = params.topicID as Long
        Topic topic = Topic.get(topicID)
        Enum Pri = topic.visibility.convert(params.Pri)
        println Pri
        topic.visibility = Pri
        topic.save(flush:true,failOnError:true)
        redirect(controller: 'login', action: 'dashboard')

    }

    def editTopic() {
        Long topicID = params.topicID as Long
        Topic topic = Topic.get(topicID)
        topicService.changeNameOfTopic(topic, params.newName)
        redirect(controller: 'login', action: 'dashboard')

    }


}
