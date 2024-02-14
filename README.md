# README

Gradz: Graduation Progress Tracker

## Overview

Gradz is a Ruby on Rails application designed to help school counselors and their academic advisees track graduation progress in an interactive and visual manner. Utilizing a PostgreSQL database, Gradz offers a comprehensive dashboard that provides a "big picture" snapshot of a student's academic journey towards meeting graduation requirements.

### Problem Statement

Many students face challenges in understanding their graduation requirements and tracking their academic progress. Gradz addresses this issue by offering a clear, intuitive visualization of completed and pending courses, akin to filling in a Connect Four game board.

## Features

- **Graduation Tracker**: A visual representation of a student's progress toward graduation, with courses categorized into four core subject areas: Math, Science, English, and Social Studies. Each completed course is represented by a shaded circle, with hover functionality displaying course names and grades.

- **Automatic Schedule Builder**: Based on the courses still required for graduation, Gradz can automatically suggest sample schedules to assist in academic planning.

- **CSV Transcript Upload**: Counselors can upload student transcripts via CSV, which the application uses to generate the graduation tracker view.

## Getting Started

### Prerequisites

- Ruby on Rails 7.1
- PostgreSQL
- 'pg' gem for PostgreSQL integration

### Installation

1. Clone the repository: `git clone <repository-url>`
2. Navigate to the application directory: `cd gradz`
3. Install dependencies: `bundle install`

4. Setup the database:
- Ensure PostgreSQL is running.
- Create and migrate the database:
  ```ruby
  rails db:create db:migrate
  ```
- Load graduation requirements into the database (See `schema.sql` for details).
5. Start the Rails server: `bin/rails server`


## Usage

To use Gradz, follow these steps:

1. Log in as a counselor.
2. Upload a student's CSV transcript via the dashboard.
3. View the student's Graduation Tracker to assess academic progress.
4. Utilize the Automatic Schedule Builder to plan for remaining requirements.
