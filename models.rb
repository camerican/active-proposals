# our system users
class User < ActiveRecord::Base
  validates_uniqueness_of :username
  has_many :proposals, foreign_key: "creator_id" # class_name: "Proposal"
  has_many :votes, class_name: "UserVote", foreign_key: "user_id"
end
# a proposal to vote on
class Proposal < ActiveRecord::Base
  belongs_to :user #, foreign_key: "id", class_name: "User"
  has_many :options, class_name: "ProposalOption", foreign_key: "proposal_id"
  has_many :votes, class_name: "UserVote", foreign_key: "proposal_id"
end
# an option for that proposal
class ProposalOption < ActiveRecord::Base
  belongs_to :proposal #, class_name: "Proposal", foreign_key: "id"
  has_many :votes, class_name: "UserVote", foreign_key: "option_id"
end
# a user's vote on a proposal
class UserVote < ActiveRecord::Base
  belongs_to :user #, class_name: "User", foreign_key: "id"
  belongs_to :option, class_name: "ProposalOption"
  belongs_to :vote, class_name: "UserVote"
end