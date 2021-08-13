package assessment

class SubscriptionController {
    SubscribeService subscribeService

    def addSubscription() {
        User user = User.findWhere(username: session.username)
        def subID = params.subID as Long
        Topic topic = Topic.get(subID)
        subscribeService.addSubscriptions(user, topic)
        flash.addSub = "${topic.name} added to your Subscribed Topics"
        redirect(controller: 'login', action: 'dashboard')
    }

    def removeSubscription() {
        User user = User.findWhere(username: session.username)
        def subID = params.subID as Long
        Topic topic = Topic.get(subID)
        Subscription sub = Subscription.findByUserAndTopic(user, topic)
        sub.delete(flush: true, failOnError: true)
        flash.removeSub = "${topic.name} removed from your Subscribed Topics"
        redirect(controller: 'login', action: 'dashboard')
    }

    def changeSeriousness() {
        User user = User.findWhere(username: session.username)
        def topicID = params.topicID as Long

        Topic topic = Topic.get(topicID)

        Subscription s = Subscription.findByUserAndTopic(user, topic)
        println s
        subscribeService.changeSeriousness(s, params.Ser)
        redirect(controller: 'login', action: 'dashboard')
    }

    def inviteSubscription() {
        def topic = Topic.findByName(params.topicInvite)
        def user = User.findByEmail(params.emailInvite)
        def og = User.findWhere(username: session.username)
        println user
        def send = params.emailInvite
        if (user) {
            sendMail {
                to send
                subject 'Subscribe: ' + topic.name
                body og.firstName + ' has invited you to Subscribe to This Interesting Topic:  http://localhost:9091/subscription/emailVerify?t=' + topic.name + '&u=' + user.username
            }
            flash.inviteSent = "Invite Sent to ${params.emailInvite} for topic ${params.topicInvite}!!"
            redirect(controller: 'login', action: 'dashboard')
        } else {
            sendMail {
                to send
                subject 'Link Sharing Application'
                body 'Hey ' + og.firstName + ' Has invited you to join this interesting learning and sharing Application:  http://localhost:9091/'
            }
            flash.inviteSent = "Since there is no user with ${params.emailInvite} Invite has been Sent to create Account on Link Sharing Application"
            redirect(controller: 'login', action: 'dashboard')
        }

    }

    def emailVerify(String t, String u) {
        User user = User.findByUsername(u)
        println u
        Topic topic = Topic.findByName(t)
        println t
        render(view: 'logInToSubscribe', model: [user: user, topic: topic])

    }

    def subscribeUsingMail() {
        User user = User.findByUsernameAndPassword(params.username,params.password)
        Topic topic = Topic.findByName(params.topicName)
        if(user){

            Subscription test = Subscription.findByUserAndTopic(user, topic)
            if (test) {
                flash.alreadySubscribed = "Hi ${user.firstName}, You are already Subscribed to Topic ${topic.name}"
                redirect(url: 'http://localhost:9091/')
            } else {
                subscribeService.addSubscriptions(user, topic)
                flash.subscriptionDone = "Hi ${user.firstName}, You are now Subscribed to Topic ${topic.name}, Happy Learning & Sharing"
                redirect(url: 'http://localhost:9091/')
            }
        }
        else {
            flash.wrongPassword = "Incorrect Password Entered, Try Again !"
            redirect(action: 'emailVerify',params:[t:params.topicName,u:params.username])
        }


    }
}