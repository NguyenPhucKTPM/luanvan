<?php

namespace App\Observers;

use App\Models\Book;

class BookObserver
{
    public function updating(Book $book): void
    {
        $changedAttributes = $book->getDirty();
        $onlyViewColumnsChanged = array_key_exists('luotXem', $changedAttributes) 
                                  || array_key_exists('luotDoc', $changedAttributes) 
                                  || array_key_exists('luotMuon', $changedAttributes);

        if ($onlyViewColumnsChanged && count($changedAttributes) == 1) {
            $book->timestamps = false;
        }
    }
}
