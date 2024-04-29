
# Norris Jokes - iOS App
MTB Trials is an app for mountain bikers who use Strava and want to gamify competition between friends and fellow riders. This iOS App syncs to your Strava data and allows you to gain insight on friends top speeds, 
compare times, and earn badges for increasing your speed and time on the trails! 


## Video Demo
![EC-NorrisJokes-capstone-Blair-ezgif com-optimize](https://github.com/dezdoesit/NorrisApp/assets/117093220/0e9389d6-c4cd-49e1-9afa-6bb7d5e7ec2d)




## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)

## Technologies
Project is created with:
* Lorem version: 12.3
* Ipsum version: 2.33
* Ament library version: 999


## API Reference

#### Get all items

```http
  GET /api/items
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |

#### Get item

```http
  GET /api/items/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to fetch |

#### add(num1, num2)

Takes two numbers and returns the sum.

