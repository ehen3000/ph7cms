<div class="center" id="picture_block">

{@if(empty($error))@}

{@foreach($albums as $album)@}

{{ $absolute_url = Framework\Mvc\Router\UriRoute::get('picture','main','album',"$album->username,$album->name,$album->albumId") }}

<div class="thumb_photo">

<h4>{% Framework\Security\Ban\Ban::filterWord($album->name) %}</h4>
<a href="{absolute_url}"><img src="{url_data_sys_mod}picture/img/{% $album->username %}/{% $album->albumId %}/{% $album->thumb %}" alt="{% $album->name %}" title="{% $album->name %}" /></a>
<p>{% nl2br(Framework\Security\Ban\Ban::filterWord($album->description)) %}</p>
<p class="italic">{@lang('Views:')@} {% Framework\Mvc\Model\Statistic::getView($album->albumId,'AlbumsPictures') %}</p>

 {@if(UserCore::auth() && $member_id == $album->profileId)@}
   <div class="small">
   <a href="{{$design->url('picture', 'main', 'editalbum', $album->albumId)}}">{@lang('Edit')@}</a> |
   {{ LinkCoreForm::display(t('Delete'), 'picture', 'main', 'deletealbum', array('album_id'=>$album->albumId)) }}
   </div>
 {@/if@}

<p>
{{ RatingDesignCore::voting($album->albumId,'AlbumsPictures') }}
{{ $design->like($album->username,$album->firstName,$album->sex,$absolute_url) }} | {{ $design->report($album->profileId, $album->username, $album->firstName, $album->sex) }}
</p>

</div>

{@/foreach@}


{@main_include('page_nav.inc.tpl')@}

{@else@}

<p>{error}</p>

{@/if@}

<p class="bottom"><a class="m_button" href="{{$design->url('picture', 'main', 'addalbum')}}">{@lang('Add a new album')@}</a></p>

</div>
