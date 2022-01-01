'''
https://stackoverflow.com/questions/70297028/i-have-a-problem-with-dislike-error-when-creating-an-pafy-new-url-perhaps-its
just comment the line 53 and 54 from backend_youtube_dl.py in your packages path
'''
        self._viewcount = self._ydl_info['view_count']
        #self._likes = self._ydl_info['like_count']
        #self._dislikes = self._ydl_info['dislike_count']
        self._username = self._ydl_info['uploader_id']
