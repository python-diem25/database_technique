from database import get_connection

def show_training_volume(user_id, start_date, end_date):
    conn = get_connection()
    cursor = conn.cursor()

    cursor.callproc("GetUserTrainingVolume", [user_id, start_date, end_date])

    print("\nTraining Volume:")
    for result in cursor.stored_results():
        for row in result.fetchall():
            print(f"User: {row[1]} | Total Volume: {row[2]} kg")

    cursor.close()
    conn.close()


def calculate_1RM(weight, reps):
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("SELECT calculate_1RM(%s, %s)", (weight, reps))
    result = cursor.fetchone()

    print(f"\nEstimated 1RM: {result[0]} kg")

    cursor.close()
    conn.close()


def list_exercises():
    conn = get_connection()
    cursor = conn.cursor()

    query = """
    SELECT e.exercise_id, e.name, mg.name
    FROM Exercise e
    LEFT JOIN ExerciseMuscleGroup emg ON e.exercise_id = emg.exercise_id
    LEFT JOIN MuscleGroup mg ON emg.muscle_id = mg.muscle_id
    """

    cursor.execute(query)
    rows = cursor.fetchall()

    print("\nExercises:")
    for r in rows:
        print(f"ID: {r[0]} | Name: {r[1]} | Muscle Group: {r[2]}")

    cursor.close()
    conn.close()
