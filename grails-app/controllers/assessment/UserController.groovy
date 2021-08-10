package assessment

import grails.converters.JSON

class UserController {

    def index() {
        Long userID = params.userID as Long
        User og = User.get(userID)
        User user = User.findWhere(username: session.username)
        render(view: 'userprofile',model: [user:user,og:og])
    }


    def changeProfile(){
        User user = User.findWhere(username:session.username)
        render(view: 'editprofile',model: [user:user])
    }
    def editProfile(){
            User user = User.findWhere(username:session.username)
            if(params.username){
                User test = User.findWhere(username: params.username)
                if(!test){
                    println "if case"
                    user.username = params.username
                    flash.userUpdated = "User Details Successfully Updated"
                    session.username = params.username
                }
                else{
                    println "else case"
                    flash.usernameTaken = "Username Already Taken Try Something Different"
                }
            }
            if(params.firstName){
                println "firstName"
                user.firstName = params.firstName
                flash.userUpdated = "User Details Successfully Updated"
            }
            if(params.lastName){
                println "lastName case"
                user.lastName = params.lastName
                flash.userUpdated = "User Details Successfully Updated"
            }
            if(params.profilePhoto){
                println params.profilePhoto
                def profilePhoto = request.getFile("profilePhoto")
                String origin = profilePhoto.getOriginalFilename()
                if (origin) {
                    File file = new File("/home/rxlogix/IdeaProjects/Assessment/grails-app/assets/images/profilePicture/${params.username}.jpg")
                    profilePhoto.transferTo(file)
                    user.photo ="/profilePicture/${params.username}.jpg"
                }
                flash.userUpdated = "User Details Successfully Updated"
            }


        try{
            user.save(flush:true, failOnError:true)
        }catch(e){
            flash.userNotUpdated ="Try Again User Details Not Updated"
        }

        redirect(action: 'changeProfile')


    }
    def updatePassword(){
        if(params.newpassword==params.confirmpassword){
            User user = User.findWhere(username:session.username)
            user.password = params.newpassword
            user.save(flush:true,failOnError:true)
            flash.passwordUpdated = "Password Successfully Updated"
            redirect(action: 'changeProfile')
        }
        else{
            flash.passwordNotUpdated = "Errr...!!! Try Again"
            redirect(action:'changeProfile')
        }

    }
    def adminUser(){
        User user = User.findWhere(username: session.username)
        def allUser = User.findAll()
        render(view: 'adminuser',model: [allUser:allUser,user: user])
        //render(allUser as JSON)
    }

    def test(){
        User user = User.findWhere(username: session.username)
        def allUser = User.findAll()
        //render(view: 'adminuser',model: [allUser:allUser,user: user])
        render(allUser as JSON)
    }



    def deactivate(){
        def userID = params.userID as Long
        User testUser = User.get(userID)
        testUser.active = false
        testUser.save(flush:true,failOnError:true)
        redirect(controller:'user', action: 'adminUser')

    }
    def activate(){
        def userID = params.userID as Long
        User testUser = User.get(userID)
        testUser.active = true
        testUser.save(flush:true,failOnError:true)
        redirect(controller:'user', action: 'adminUser')

    }
}
