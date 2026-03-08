from database import get_connection

def add_exercise_log(session_id, exercise_id, set_number, weight, reps):
    conn = get_connection()
    cursor = conn.cursor()

    query = """
    INSERT INTO ExerciseLog (session_id, exercise_id, set_number, weight, reps)
    VALUES (%s, %s, %s, %s, %s)
    """
    cursor.execute(query, (session_id, exercise_id, set_number, weight, reps))
    conn.commit()

    print("Exercise logged!")
    cursor.close()
    conn.close()
