package assessment

import grails.gorm.transactions.Transactional

@Transactional
class TopicService {

    def createTopic(String topicName,String topicVisibility,User user){
        Topic topic = new Topic(name: topicName,visibility: topicVisibility)
        user.addToTopics(topic)
        topic.save(flush:true, failOnError:true)
        return topic
    }
    def changeVisibility(Topic topic, String str) {
        int value = str as int
        Enum pri = topic.visibility.convert(value)
        topic.visibility = pri
        topic.save(flush:true,failOnError:true)

    }
    def changeNameOfTopic(Topic topic, String newName){
        topic.name = newName
        topic.save(flush:true,failOnError:true)

    }


}
