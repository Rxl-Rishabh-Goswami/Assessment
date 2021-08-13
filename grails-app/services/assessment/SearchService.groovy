package assessment

import grails.gorm.transactions.Transactional

@Transactional
class SearchService {

    def searchPost(String searchKey) {
        String key = '%' + searchKey + '%'
        List publicTopic = Topic.findAllByVisibility(0)
        List searchTopic = Topic.createCriteria().list() {
            ilike('name', key)
        }
        List searchPost
        if (searchTopic) {
            searchPost = Resource.createCriteria().list() {
                or {
                    ilike('description', key)
                    inList('topic', searchTopic)
                }
                inList('topic', publicTopic)
            }
        } else {
            searchPost = Resource.createCriteria().list() {
                or {
                    ilike('description', key)
                }
                inList('topic', publicTopic)
            }
        }
        return searchPost
    }


}
