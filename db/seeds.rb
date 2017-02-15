require 'date'
## Create Users
User.create fname: 'Cam', lname: 'Crews', username: "camerican", password: "FluffyBunny"
User.create fname: 'Ber', lname: 'Cohen'
User.create fname: 'James', lname: 'Sullivan'
User.create fname: 'Alfe', lname: 'Corona'
User.create fname: 'Jarvis', lname: 'Potter'
User.create fname: 'Robert', lname: 'Rappole'
User.create fname: 'Steve', lname: 'DeLeon'
User.create fname: 'Nick', lname: 'Vaden'
User.create fname: 'Sel', lname: 'Erol'
User.create fname: 'Hak', lname: 'Lim'
User.create fname: 'Kyle', lname: 'Harmon'
User.create fname: 'Joel', lname: 'Jester'
User.create fname: 'Eric', lname: 'Sui'
User.create fname: 'Angie', lname: 'Hill'
User.create fname: 'Mauricio', lname: 'Garcia'
## Create Proposals
Proposal.create name: 'Class Nickname', creator_id: 1, status: 'Open', deadline: Date.parse("February 24, 2017")
Proposal.create name: 'Lasagna', creator_id: 4, status: 'Delicious', deadline: nil
Proposal.create name: 'Float Kings', creator_id: 6, status: 'Ambiguous', deadline: nil
Proposal.create name: 'Macchiato Time', creator_id: 4, status: 'Open', deadline: Date.parse("February 24, 2017")




