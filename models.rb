# our system users
class User < ActiveRecord::Base
end
# a proposal to vote on
class Proposal < ActiveRecord::Base
end
# an option for that proposal
class ProposalOption < ActiveRecord::Base
end
# a user's vote on a proposal
class UserVote < ActiveRecord::Base
end