[![Build Status](https://travis-ci.org/khoifishpond/snowmigo-fe.svg?branch=main)](https://travis-ci.org/khoifishpond/snowmigo)

# Snowmigo FE

The front-end half of a Consultancy project during weeks four and five during Mod 3 of Turing. For back-end, please visit [Snowmigo](https://github.com/hschmid516/snowmigo-api).


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#deployment">Deployment</a></li>
    <li><a href="#features">Features</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project
  <p>
    The goal of this project is to create a successful web application from a student-led project idea. Our team created an app that will allow users to authenticate with a third-party service and consume two other APIs. This application is responsible for authentication via OAuth.
  </p>

<p align="right">(<a href="#top">back to top</a>)</p>


### Built With
#### Framework
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
</p>

#### Languages
<p>
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white" />
</p>

#### Tools
<p>
  <img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />
  <img src="https://img.shields.io/badge/VS_Code-007ACC?logo=visual%20studio%20code&logoColor=ffffff" />
  <img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Heroku-430098.svg?&style=flaste&logo=heroku&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white" />

</p>

#### Gems
<p>
  <img src="https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/faker-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/shoulda--matchers-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/capybara-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/omniauth_google_oauth2-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" /> </br>
  <img src="https://img.shields.io/badge/figaro-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/orderly-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/launchy-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/factory--bot-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/vcr-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/travis-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
</p>

#### Development Principles
<p>
  <img src="https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white" />
</p>


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

### Installation

1. Clone the repo
   ```sh
   git clone git@github.com/khoifishpond/snowmigo-fe.git
   ```
3. Run bundle
   ```sh
   bundle install
   ```
4. Run migrations
   ```sh
   rails db:{drop,create,migrate,seed}
   ```

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- DEPLOYMENT -->
### Deployment

Visit [Herkou](https://snowmigo.herokuapp.com)

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- ROADMAP -->
## Features

- [x] Implement Google OAuth </br></br>
  <img src="https://user-images.githubusercontent.com/58535045/141173676-86c7266b-1e7d-42aa-b4de-ec0365f6c7d6.png" />
- [x] Search resorts by State </br></br>
  <img src="https://user-images.githubusercontent.com/58535045/141174882-5c8c289c-72d0-4496-a329-9e98f4bd087a.png" />
- [x] Plan a trip! </br></br>
  <img src="https://user-images.githubusercontent.com/58535045/141175129-f75fc87a-e462-4221-a0d3-224645a44e1c.png" />

See the [open issues](https://github.com/khoifishpond/snowmigo-fe/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

<p>
  <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" />
</p>

- [Henry Schmid](https://www.linkedin.com/in/henry-schmid)
- [Erika Kischuk](https://www.linkedin.com/in/erika-kischuk)
- [Laura Court](https://www.linkedin.com/in/andrew-massey-b06662194/)
- [Khoi Nguyen](https://www.linkedin.com/in/khoifishpond/)
- [Ozzie Osmonson](https://www.linkedin.com/in/ozzie-osmonson/)

<p>
  <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" />
</p>

- [Henry Schmid](https://github.com/hschmid516)
- [Erika Kischuk](https://github.com/eakischuk)
- [Laura Court](https://github.com/lmcourt)
- [Khoi Nguyen](https://github.com/khoifishpond)
- [Ozzie Osmonson](https://github.com/ozzman84)


<p align="right">(<a href="#top">back to top</a>)</p>