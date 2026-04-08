import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ['posts', 'frame','toggleBtn', 'commentSection']
    static values = {url: String}
    connect() {
        console.log("the url: ", this.urlValue)
        console.log("current target: ", this)
    }
    show(){
        this.hasPostsTarget ? console.log("wow there are posts") : console.log("wow there are not posts/")

    }
    switch_partial(event){
        // this is to switch the partials
    const url = event.currentTarget.dataset.url;
    const frame = document.getElementById("post_ad")
        if(this.hasFrameTarget){
            console.log("partial targeted: ", this.frameTarget)
            // this.frameTarget.src == '/posts' ? this.frameTarget.src ='/comments': this.frameTarget.src ='/posts'
        }
        else{
            console.log("this is not partial frame to target: ", this.frameTarget)

        }
        if(frame && url){
            console.log("frame: ",frame)
            console.log("url: ",url)
            frame.src = url

        }
    }
    toggleComment(){
        this.commentSectionTarget.classList.toggle("d-none")

    }
}