class SongsController < ApplicationController
  helper_method :embed

  def index
    @songs = Song.all.sort_by &:created_at
    @songs.reverse!
  end

  def show
    @comment = Comment.new
    @song = Song.find(params[:id])
    @song_comments = @song.comments.sort_by &:created_at
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      redirect_to new_song_path
    end
  end


  def destroy
    Song.find(params[:id]).destroy
    redirect_to root_path
  end

  def upvote
    vote = Vote.get_vote("Song", params[:id], params[:vote][:user_id])
    if vote
      vote.change_vote_to!(1) if vote.value == -1
    else
      Vote.create(prepare_vote_params(vote_params))
    end
    respond_to do |format|
      format.json { render :json => { voteTotal: vote_total(Song.find(params[:id])) } }
    end
  end

  def downvote
    vote = Vote.get_vote("Song", params[:id], params[:vote][:user_id])
    
    if vote
      vote.change_vote_to!(-1) if vote.value == 1
    else
      Vote.create(prepare_vote_params(vote_params))
    end
    respond_to do |format|
      format.json { render :json => { voteTotal: vote_total(Song.find(params[:id])) } }
    end
  end

  def embed(song_url)
    client = Soundcloud.new(client_id: 'aa14d6213fea0d5d0dce993ef44097e2')
    embed_info = client.get('/oembed', :url => song_url)

    return embed_info['html']
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist, :url)
  end

  def vote_params
    params.require(:vote).permit(:user_id, :voteable_id, :voteable_type, :value)
  end

end
