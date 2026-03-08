from user import create_user, list_users
from workout_session import create_workout_session
from exercise_log import add_exercise_log
from stats import show_training_volume, calculate_1RM, list_exercises

def main():
    while True:
        print("\n--- GymFlow Training App ---")
        print("1. Create User")
        print("2. List Users")
        print("3. Create Workout Session")
        print("4. Log Exercise")
        print("5. Show Training Volume")
        print("6. Calculate 1RM")
        print("7. List Exercises")
        print("0. Exit")

        choice = input("Choose an option: ")

        if choice == "1":
            name = input("Name: ")
            email = input("Email: ")
            create_user(name, email)

        elif choice == "2":
            list_users()

        elif choice == "3":
            user_id = input("User ID: ")
            date = input("Session Date (YYYY-MM-DD): ")
            duration = input("Duration (minutes): ")
            notes = input("Notes: ")
            create_workout_session(user_id, date, duration, notes)

        elif choice == "4":
            session_id = input("Session ID: ")
            exercise_id = input("Exercise ID: ")
            set_number = input("Set number: ")
            weight = input("Weight: ")
            reps = input("Reps: ")
            add_exercise_log(session_id, exercise_id, set_number, weight, reps)

        elif choice == "5":
            user_id = input("User ID: ")
            start = input("Start date (YYYY-MM-DD): ")
            end = input("End date (YYYY-MM-DD): ")
            show_training_volume(user_id, start, end)

        elif choice == "6":
            weight = input("Weight: ")
            reps = input("Reps: ")
            calculate_1RM(weight, reps)

        elif choice == "7":
            list_exercises()

        elif choice == "0":
            break

        else:
            print("Invalid choice.")

if __name__ == "__main__":
    main()
