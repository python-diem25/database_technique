from database import get_connection

def create_workout_session(user_id, session_date, duration, notes):
    conn = get_connection()
    cursor = conn.cursor()

    query = """
    INSERT INTO WorkoutSession (user_id, session_date, duration_minutes, notes)
    VALUES (%s, %s, %s, %s)
    """
    cursor.execute(query, (user_id, session_date, duration, notes))
    conn.commit()

    print("Workout session created!")
    cursor.close()
    conn.close()
