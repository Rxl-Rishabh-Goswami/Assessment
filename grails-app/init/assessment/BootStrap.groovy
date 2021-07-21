package assessment

class BootStrap {

    def init = { servletContext ->
        User u = new User(email: "abc@mail.com",username: "abc",password: "abc",firstName: "ab", lastName: "bc",photo: [1,2,3],admin: true,active: true)
        u.save(flush:true,failOnError:true)
        Topic t = new Topic(name: "grails", visibility: 1)
        u.addToTopics(t)
        t.save(flush:true,failOnError:true)
        Subscription s = new Subscription(seriousness: 1)
        u.addToSubscriptions(s)
        t.addToSubscriptions(s)
        s.save(flush:true,failOnError:true)
        LinkResource lr = new LinkResource(url: "rww",description: "good")
        u.addToResources(lr)
        t.addToResources(lr)
        lr.save(flush:true,failOnError:true)
        ReadingItem ri = new ReadingItem(isRead: true)
        u.addToReadingitems(ri)
        lr.addToReadingitems(ri)
        ri.save(flush:true,failOnError:true)
        ResourceRating rr = new ResourceRating(score: 5)
        u.addToResourceratings(rr)
        lr.addToResourceratings(rr)
        rr.save(flush:true,failOnError:true)

    }
    def destroy = {
    }
}
