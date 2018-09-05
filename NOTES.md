# Hike Aspiration Tracker

Step 1: Models and Relationships
  Hiker has_many aspirations
        has_many trails through aspirations
  Aspiration belongs_to hiker
             belongs_to trail
  Trail has_many aspirations (?)
        has_many hikers through aspirations

Details: A hiker can create an aspiration. The hiker can choose from existing trails, or, create a new trail to aspire to.
Future: The app can aggregate a list of trails that exist in PA via AllTrails.com or DCNR.pa.giv

Step 2: Decide Page Flow/Stub out Flow
  Q: What can visitors see on the site?  Do they need to sign up to access content? What content can they access when logged in?

  - Hiker CRUD --> Sign Up Page
  - Trail CRUD --> Who can control this? Can hikers CRUD trails? How will I avoid duplications?
  - Aspiration CRUD --> Controlled by Hiker

  Seemingly, the visitor can sign up (Create Hiker) and go to their Hiker page (no aspirations yet)

  From there, the Hiker can go through a list of Trails and add them to their aspiration list, or create a list of aspirations from their page.


Step 3: Create a route...
  x Welcome Page    application#welcome
    -Link to Log In
    x -Link to Sign Up

Step 4: Update Hiker to change :name to :username and add :password_digest
  [x] add has_secure_password to Hiker model
  [x] does gemfile include bcrypt?

Step 5:
  Sign Up Page    hiker#new
    [x] Form with information... username, password, hometown ZIP
    __ (Later: Confirm that zipcode exists -- validation !!! )
    __ (Later: Do I need a password_confirmation? --> Not yet)

    *ISSUE* Drawing a route to '/signup' instead of '/hikers/new'  I explicitly drew the route instead of using a hiker as a resource.  I need to get the route prefixes to work (hiker_path, new_hiker_path)  If I use a resource, how can I make the route go to /signup?  If I do not use a resource, how can I get the route prefixes to work?
    
  Sign Up Page    hiker#Create
    [ ] Successfully create a Hiker

Step 6: Log In and Log Out (Authentication) * Later
  [ ] generate Sessions Controller
  [ ] sessions#new -> Log In
  [ ] sessions#create -> Authenticate

Step ___ :
  [ ] OAuth through what strategy ???
