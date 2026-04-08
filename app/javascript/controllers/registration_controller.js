import { Controller} from '@hotwired/stimulus'

export default class extends Controller{

    previewAvatar(event){
        console.log('picture field added or changed!')
        const file = event.target.files[0]
        const image = document.getElementById('avatar-preview')
        if (file){
            image.src = URL.createObjectURL(file)
            image.classList.remove('d-none')
        }
        else{
            image.classList.add('d-none')
        }
    }

}