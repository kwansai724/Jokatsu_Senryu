class ApplicationController < ActionController::Base

  # 管理者画面閲覧制限
  def admin_only
    unless current_voter.present? && current_voter.admin == true
      flash[:danger] = "管理者しか閲覧出来ません。"
      redirect_back(fallback_location: "/voters/voters/index")
    end
  end

  # 投票者画面閲覧制限
  def voter_only
    unless current_voter.present? && current_voter.admin == false
      flash[:danger] = "投票者しか閲覧出来ません。"
      redirect_back(fallback_location: "/voters/voters/admin")
    end
  end

  # updateで登録するためにvoter_idを最初に登録
  def voter_id    
    @voter = Voter.find(current_voter.id)
    if @voter.voterposts.present? == false
      @voterpost = @voter.voterposts.create!(voter_id: current_voter.id)
    else 
      @voter.voterposts.each do |v|
        if current_voter.id != v.voter_id 
          @voterpost = @voter.voterposts.create!(voter_id: current_voter.id)
        end
      end  
    end
  end

end
