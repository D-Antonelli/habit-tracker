#  Habit Tracker App IOS v01

## Introduction
A mobile app that keeps track of habits with how much they're done

## Motivation
Helps people keep track of their activities

## User story
- User can add a new habit by entering name, description and category [from set of categories]
- User can click on a habit and see details
- User can tap on a habit, see details, and increase its count
- User can remove a habit

## Pages / sheets / pop-ups
- **Habits page:** Contains list of habits with details
- **Add new habit sheet:** Includes a form to add new habit
- **Detail sheet:** Contains details of a selected habit
- **failure pop-up:** Pops up upon having left a required form field empty.

## Business logic
- User will land in to **Habits page**
- If, there are habits saved on database, they will load and appear
- If, there are no habits recorded, there will be **add a new habit** indicator on screen.
- When user taps to add a new habit, they will land on **add new habit** page
- User will fill in form to add details such as:
  - `$title`: Required, with `$title_placeholder`
  - `$count`: Not required, with default value of 1.
  - `$description`: Required, with `$description_placeholder`
- If user saves form without filling in required fields, a **failure pop-up** appears.

## Strings
| placeholder  | value  |
|---|---|
| `$title`  | Name your habit  |
| `$title_placeholder`  | Coffee, tea, jogging, etc.  |
| `$count`  | Default count  |
| `$count`  | Default count |
| `$description` | Add a note |
| `$description_placeholder` | I want to set this goal with 10 counts etc.. |
| `$save` | Save |

