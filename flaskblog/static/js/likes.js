$(function(){

    console.log('likesssssssss')
    $('#like-btn').on('click',function(){

        console.log('like clicked');
        $.ajax({
            url:`/add_likes`,
            method:'GET',
            data:{
                post_id:$('#post_id').val(),
                action:'like'
            },
            success:function(response){
                
              console.log(response)
            
            }
        })
        
    });


    $('#dislike-btn').on('click',function(){
        $.ajax({
            url:`/add_likes`,
            method:'GET',
            data:{
                post_id:$('#post_id').val(),
                action:'dislike'
            },
            success:function(response){
                    console.log(response)
            }
        })
        
    });

})

