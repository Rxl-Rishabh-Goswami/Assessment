package assessment

import assessment.dto.PostDto
import grails.converters.JSON

class SearchController {
    SearchService searchService
    PostService postService

    def searchPage() {
        User user = User.findWhere(username: session.username)
        if(user){
            String searchKey = params.searchKey
            List searchPost = searchService.searchPost(searchKey)
            if (user) {
                List recent = postService.recent()
                List trend = postService.trend()
                render(view: 'Search', model: [user: user, searchPost: searchPost, searchKey: searchKey, recent: recent, topic: trend])
            } else {
                render(view: 'Search2', model: [searchPost: searchPost, searchKey: searchKey])
            }
        }else{
            redirect(url: 'http://localhost:9091/')
        }


    }
    def searchAjax(){
        String searchKey = params.searchKey
        List searchPost = searchService.searchPost(searchKey)
        List<PostDto> topDetails = []
        searchPost.each {
            topDetails << new PostDto(firstName: it.user.firstName, lastName: it.user.lastName, username: it.user.username, photo: it.user.photo, description: it.description, name: it.topic.name)
        }

            render(topDetails as JSON)


    }
}
