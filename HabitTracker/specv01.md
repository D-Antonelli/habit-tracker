#  Habit Tracker App IOS v01

## Introduction
A mobile app that keeps track of habits with how much they're done

## Motivation
Helps people keep track of their activities

## User story
- User can add a new habit
- User can see details of a habit
- User can remove a habit
- User can increase the count of habit

## Pages / sheets / pop-ups
- **Habits page:** Contains list of habits with details such as `$title`, `$total_count`, and right details arrow
- **Add new habit sheet:** Includes a form to add new habit with details below
  - `$title`: Required, with `$title_placeholder`
  - `$count`: Not required, with default value of 1.
  - `$description`: Required, with `$description_placeholder`
- **Detail sheet:** Contains details of a selected habit with following
  - `$title` 
  - `$description` 
  - delete button
  - add count button
- **failure pop-up:** Pops up upon having left a required form field empty. Has `$pop_up_button`
- **delete pop-up:** Pops up when user attempts to delete an entry
  - `$delete_title`
  - `$delete_body`
  - cancel button
  - delete button

## Business logic
- User will land in to **Habits page**
- If, there are habits saved on database, they will load and appear
- If, there are no habits recorded, there will be **add a new habit** indicator on screen.
- When user taps to add a new habit, they will land on **add new habit** page
- User will fill in form to add details.
- If user saves form without filling in required fields, a **failure pop-up** appears.
- User can go back to form by pressing `$pop_up_button`
- If user fills-in all required fields, they will press `$save`
- Then, user will be redirected to **Habits page**
- If user taps right details arrow, they will be redirected to **Detail sheet**
- If user presses delete button, **delete pop-up** will appear.
- If user taps cancel, pop-up will close and they will be redirected to **Detail sheet**
- If user taps delete, pop-up will close, entry will be deleted and they will be redirected to **Habits page**


## Strings
| placeholder  | value  |
|---|---|
| `$title`  | Name your habit  |
| `$title_placeholder`  | Coffee, tea, jogging, etc.  |
| `$count`  | Default count  |
| `$description` | Add a note |
| `$description_placeholder` | I want to set this goal with 10 counts etc.. |
| `$save` | Save |
| `$pop_up_button` | OK |
| `$total_count` | Total count |
| `$delete_title` | Delete `item` |
| `$delete_body` | Are you sure you want to delete `item` |

## Wireframe
Will follow up

